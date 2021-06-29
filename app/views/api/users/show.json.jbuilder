json.user do
    json.set! @user.id do
        json.extract! @user, :id, :username
    end
end

json.yips do
    @user.yips.each do |yip|
        json.set! yip.id do
            json.partial! 'api/yips/yip', yip: yip
        end
    end
end