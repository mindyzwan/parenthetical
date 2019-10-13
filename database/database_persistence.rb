require "pg"

class DatabasePersistence
  def initialize(logger)
    if Sinatra::Base.test?
      @db = PG.connect(ENV['DATABASE_URL'])
    else
      @db = PG.connect(dbname: "parenthetical")
    end
    @logger = logger
  end

  def query(statement, *params)
    @logger.info "#{statement}: #{params}" # Funtionailty that provides the ability to see d-bug output in the localhost terminal
    @db.exec_params(statement, params)
  end

  def disconnect
    @db.close
  end

  def all_users
    sql = "SELECT * FROM users"
    query_result = query(sql)
    tuple_to_user_list_hash(query_result)
  end

  def add_new_user(first_name, last_name, email)
    sql = "INSERT INTO users (first_name, last_name, email) VALUES ($1, $2, $3)"
    query(sql, first_name, last_name, email)
  end

  def delete_user(id)
    sql = "DELETE FROM users WHERE id = $1"
    query(sql, id)
  end

  def get_user_from_email(email)
    sql = "SELECT * FROM users WHERE email = $1"
    query_result = query(sql, email)
    user = tuple_to_user_list_hash(query_result)[0]
  end

  def add_new_script(script_name, content, user_id)
    sql = "INSERT INTO scripts (script_name, content, user_id) VALUES ($1, $2, $3)"
    query(sql, script_name, content, user_id)
  end
  
  def all_scripts
    sql = "SELECT * FROM scripts"
    query_result = query(sql)

    query_result.map do |tuple|
      {
        id: tuple["id"],
        script_name: tuple["script_name"],
        content: tuple["content"]
      }
    end
  end

  def edit_script(id, new_script_name, new_content)
    sql = "UPDATE scripts SET script_name = $1, content = $2 WHERE id = $3;"
    query(sql, id, new_script_name, new_content)
  end
  
  def delete_script(id)
    sql = "DELETE FROM scripts WHERE id = $1"
    query(sql, id)
  end  

  def tuple_to_user_list_hash(query_result)
    query_result.map do |tuple|
      { 
        id: tuple["id"], 
        first_name: tuple["first_name"],
        last_name: tuple["last_name"], 
        email: tuple["email"]
      }
    end
  end
end
