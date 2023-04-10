require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert true
  end

  test 'get list of tasks' do
    get '/tasks'
    assert_response :success
    assert_select 'h1', 'Tasks list'
    assert_select 'h4', 'MyString1'
    assert_select 'h4', 'MyString2'
  end

  test 'opens one task page with fixture' do
    task = tasks(:task_one)
    get task_path(task)
    assert_response :success
    assert_select 'h1', "Task:    #{task.name}"
    assert_select 'p', "Description: #{task.description}"
  end

  test 'create new task' do
    post '/tasks', params: { task: { name: 'Task3',
                                     description: 'MyText3',
                                     status: 'MyString3',
                                     creator: 'MyString3',
                                     performer: 'MyString3',
                                     completed: false } }
    assert_response :found
    task = Task.find_by(name: 'Task3')
    get task_path(task)
    assert_response :success
    assert_select 'h1', "Task:    #{task.name}"
    assert_select 'p', "Description: #{task.description}"
  end

  test 'update task' do
    put task_path(tasks(:task_one)), params: { task: { name: 'Updated task1' } }
    assert_response :found
    task = tasks(:task_one)
    get task_path(task)
    assert_response :success
    assert_select 'h1', 'Task:    Updated task1'
    assert_select 'p', "Description: #{task.description}"
  end

  test 'delete task' do
    delete task_path(tasks(:task_one))
    assert_response :found
    assert_not_includes(Task.all, tasks(:task_one))
  end
end
