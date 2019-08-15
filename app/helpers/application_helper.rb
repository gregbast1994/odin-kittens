module ApplicationHelper
    def full_title(title)
        base = "Kittens API"
        title.empty? ? base : title + ' | ' + base
    end
end
