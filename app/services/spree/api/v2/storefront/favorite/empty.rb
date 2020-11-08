module Spree
  module Api
    module V2
      module Storefront
        module Favorite
          class Empty
            prepend Spree::ServiceModule::Base

            def call(user:)
              return failure(user) unless Spree::Favorite.where([ 'user_id = ?', user.id ]).delete_all
              success(user)
            end
          end
        end
      end
    end
  end
end
