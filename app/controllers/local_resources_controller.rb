class LocalResourcesController < ApplicationController
  def index
    @local_resources = LocalResource.all
  end
end