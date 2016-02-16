module OpenEsys
  module Oruka
    #
    # Bluetooth を使うラッパー的な何か(｀･ω･´)
    module Bluetooth
      #
      # btaddr が近くに存在するかどうかを返す
      # @param [String] btaddr アドレス名
      # @param [Boolean] いるかどうか
      def exist?(btaddr)
        case hcitool_name(btaddr)
        when "" then false
        else true
        end
      end

      #
      # `hcitool name` を実行する
      # @param [String] btaddr btaddr
      # @return [String] 実行結果の文字列
      def hcitool_name(btaddr)
        `hcitool name #{btaddr}`
      end
    end
  end
end
