module CompanyHelper
  def operations_on_task(task)
    links = []
    links << link_to('削除', company, :method => :delete,
      :confirm => '本当に削除しますか？')
  end
end
