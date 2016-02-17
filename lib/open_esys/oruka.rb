require "open_esys/oruka/bluetooth"
require "open_esys/oruka/version"

require "parallel"

module OpenEsys
  module Oruka
    #
    # 最大同時接続数
    MAX_CONNECTION = 7

    #
    # 引数に与えられた btaddr からいるかどうかをスキャンする
    # @param[Hash[String, String]] list [名前, btaddr]
    # @return [Hash[String, Boolian]] その名前がいるか
    def scan(list)
      Parallel.map(list, in_threads: MAX_CONNECTION) {
        |k, v| [k, Bluetooth.exist?(v)]
      }.to_h
    end
  end
end
