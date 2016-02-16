require "open_esys/oruka/bluetooth"
require "open_esys/oruka/version"

module OpenEsys
  module Oruka
    #
    # 引数に与えられた btaddr からいるかどうかをスキャンする
    # @param[Array[String]] list 存在を確認するリスト
    # @return [Hash[String, Boolian
    def scan(list)
      array = list.map { |item| [item, Bluetooth.exist?(item)] }
      Hash[*array]
    end
  end
end
