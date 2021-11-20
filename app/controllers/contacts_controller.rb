class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    # @contact.update(contact_params)
    # if @contact.contact_status == "未対応"
    #   @contact.update(contact_status: "未対応")
    # end
  end 


  def confirm
    @contact = Contact.new(contact_params)

    if @contact.valid?
      render :confirm
    else
      render :new
    end
  end

  # 入力内容に誤りがあった場合、
  # 入力内容を保持したまま前のページに戻るのが当たり前になっているかと思いますが、
  # backアクションを定義することで可能となります。
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  # 実際に送信するアクションになります。
  # ここで初めて入力内容を保存します。
  # セキュリティーのためにも一定時間で入力内容の削除を行ってもいいかもしれません。
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to done_path
    else
      render :new
    end
  end


  # 送信完了画面を使用する場合お使いください。
  def done
  end

  private

  def contact_params
    params.require(:contact)
          .permit(:email,
                  :name,
                  :phone_number,
                  :subject,
                  :message,
                  :contact_status,
                 )
                 
  end
end

