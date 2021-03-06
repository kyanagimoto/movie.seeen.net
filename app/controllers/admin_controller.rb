class AdminController < ApplicationController
  BATCH_MESSAGE_PATH = "#{Rails.root.to_s}/data/monitor_of_batches/"

  layout 'admin'

  def index
    @messages = []
    Dir.glob(BATCH_MESSAGE_PATH + '*.*.mon') do |path|
      begin
        message = YAML.load_file(path)
        message[:_target] = target path
        @messages << message
      rescue => e
        logger.info "Not load file at #{path}"
      end
    end

    @unresolves = Report.unresolves
  end

  def messages
    @message = nil
    Dir.glob(BATCH_MESSAGE_PATH + "*.#{params[:target]}.mon") do |path|
      begin
        @message = YAML.load_file(path)
        @message[:_target] = target path
      rescue
        logger.info "Not load file at #{path}"
      end
    end
    if @message.nil?
      return redirect_to(admin_path)
    end
    if @message[:messages][params[:message_id]].blank?
      return redirect_to(admin_path)
    end
  end


  protected

  def logged_in?
    author = super
    logged_into_admin author
  end


  private

  def target(path)
    File::basename(path).split('.')[1]
  end
end
