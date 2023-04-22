# A way to ascribe attributes to the "current" user. Neat!
class Current < ActiveSupport::CurrentAttributes
  attribute :user
end
