module ControllerHelpers
    def log_in(user)
        warden = request.env['warden']
        if user
            allow(warden).to receive(:authenticate!).and_return(user)
            allow(controller).to receive(:current_user).and_return(user)
        else
            allow(warden).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
            allow(controller).to receive(:current_user).and_return(nil)
        end
    end
end
# https://github.com/plataformatec/devise/wiki/How-To:-Stub-authentication-in-controller-specs
