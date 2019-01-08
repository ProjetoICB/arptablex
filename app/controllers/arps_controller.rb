class ArpsController < ApplicationController


  before_filter :check_logged
def index

  @arps = Arp.search(params[:search], params[:search1], params[:search2], params[:search3], params[:search4])

  respond_to do |format|
      format.html # index.html.erb
      format.json { render json; @arps }
    end
end

end
