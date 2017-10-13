module ApplicationHelper
  def full_title title
    title.empty? ? t("app_title") : title + " | " + t("app_title")
  end

  def avatar_profile user
    if user
      @avatar = user.avatar_url
      if user && @avatar
        @avatar
      else
        "avatar.png"
      end
    end
  end

  def user_reply_comment comment
    if comment
      comment_reply = comment.reply
      if comment_reply && comment_reply.user != comment.user
        link_to comment_reply.user.name, comment_reply.user
      end
    end
  end

  def check_opacity review, type
    if current_user && current_user.send(type, review)
      "activity-opacity"
    end
  end
end
