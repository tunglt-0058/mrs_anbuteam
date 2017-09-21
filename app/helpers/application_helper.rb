module ApplicationHelper
  def full_title title
    title.empty? ? t("app_title") : title + " | " + t("app_title")
  end
end
