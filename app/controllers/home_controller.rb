class HomeController < ApplicationController
    def menu
        # displays (gets) a page with links to interact with the site
            # e.g play, view instructions, view about
    end

    def transition
        render :layout => false
        # transitions to menu after playing a fun gif
    end
end
