<!DOCTYPE html>
<html>
  <head>
    <title>Add Movie</title>
    <link rel="stylesheet" href="addmov.css">
  </head>
  <body>
    
      <h1>Add Movie</h1>

      <form action="ValidateMovieAndAdd.jsp">
        
          <label for="name">Name</label>
          <input type="text" id="name" name="m_name" required>
      
        
          <label for="year">Year</label>
          <input type="text" id="year" name="m_year" required>
        

        
          <label for="genre">Genre</label>
          
          <select id="genre" name="m_genre" required>
            <option value="Action">Action</option>
            <option value="Comedy">Comedy</option>
            <option value="Drama">Drama</option>
            <option value="Horror">Horror</option>
            <option value="Romance">Romance</option>
            <option value="Animation">Animation</option>
            <option value="Documentary">Documentary</option>
            <option value="Sci-fi">Sci-fi</option>
            <option value="Thriller">Thriller</option>
            <option value="Fantasy">Fantasy</option>
            <option value="Mystery">Mystery</option>
            <option value="Adventure">Adventure</option>
            <option value="Musical">Musical</option>
            <option value="Family">Family</option>
          </select>

        

        <div class="form-group">
          <label for="description">Description</label>
          <textarea id="description" name="m_description" required></textarea>
        </div>
        <div class="form-group">
          <button type="submit" class="confirm-button">Confirm</button>
          
        </div>
      </form>


    
  </body>
</html>