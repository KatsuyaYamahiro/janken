class Game < ApplicationRecord
    #じゃんけん
    #受け取った手に勝利する手を返す
    def self.com_hand_create(game_params)

        #5~10秒間スリープする
        sleep(rand(5)+5)

        if game_params[:my_hand] == "gu" then
            "pa"
        elsif game_params[:my_hand] == "tyo" then
            "gu"
        else
            "tyo"
        end
    end

end
