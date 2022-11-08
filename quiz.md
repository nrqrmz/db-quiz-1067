### What’s a relational database?
- Set of tables related primary keys and foreign keys.

### What are the different “table relationships” you know?
- 1:1
- 1:N
- N:N
- 2 independent tables

### What’s the language to make queries to a database?
- SQL (structured query language)

### What’s the SQL query to get books written before 1985?

```SQL
SELECT * FROM books
WHERE publishing_year < 1985;
```

### What’s the SQL query to get the 3 most recent books written by Jules Verne?
```SQL
SELECT * FROM books
JOIN authors ON authors.id = books.author_id
WHERE authors.name = 'Jules Verne'
ORDER BY books.publishing_year DESC
LIMIT 3;
```

### What’s the purpose of Active Record?
- Run SQL in a mapped database linking columns with instance variables and row with instances.

### What’s a migration?
- Modifying a tables in a database.

### How do you run a migration?

```
rake db:migrate
```

### Complete the following migrations to create your e-library database.

```ruby
class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.timestamps
    end
  end
end
```
### Complete the following migrations to create your e-library database.

```ruby
class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.integer :publishing_year
      t.string :title
      t.references :author, foreign_key: true
      t.timestamps
    end
  end
end
```

```ruby
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :email
      t.timestamps
    end
  end
end
```

```ruby
class CreateReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
```

### Write a migration to add a category column to the books table.


```ruby
class AddCategoryToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :category, :string
  end
end
```

```ruby
#1. Add your favorite author to the DB
Author.create(name: 'Napoleon Hill')
# author = Author.new(name: 'Napoleon Hill')
# author.save!

#2. Get all authors
Author.all

#3. Get author with id=8
Author.find(8)

#4. Get author with name="Jules Verne", store it in a variable: jules
jules = Author.where(name: 'Jules Verne')

#5. Get Jules Verne's books
jules.books

#6. Create a new book "20000 Leagues under the Seas". Store it in a variable: twenty_thousand
twenty_thousand = Book.create(title: "20000 Leagues under the Seas", publishing_year: 1869)

#7. Add Jules Verne as this book's author
twenty_thousand.author = jules

#8. Now save this book in the DB!
twenty_thousand.save
```

### Can we save an object in the DB if its validations do not pass?
- No
