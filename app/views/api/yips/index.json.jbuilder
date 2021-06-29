# json.array! @yips, :id, :body, :author_id

@yips.each do |yip|
    json.set! yip.id do
        # json.extract! yip, :id, :body, :author_id
        json.partial! 'api/yips/yip', yip: yip
        json.author do # This does not create a normalized state -- DEMO only
            json.extract! yip.author, :id, :username
        end
    end
end