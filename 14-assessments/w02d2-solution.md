# w02d2 solutions
1. There is mainly two ways. 1) download the js file and 2) use a cdn link.
  - `<script src="js/app.js"></script>`
  - `<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>`
2. As always we need to wrap our code with `$(document).ready(function(){ //your code here});`
3. With the following html...
  
  ```html
  <body>
    <div>
      <ul> <!-- awesome list -->
        <li>first</li>
        <li>second</li>
        <li>third</li>
      </ul>
    </div>
    <ul> <!-- random list -->
      <li>ha</li>
      <li>he</li>
      <li>ho</li>
      <li>forth</li>
    </ul>
    <table>
      <thead>
        <tr>
          <th>First Name</th>
          <th>Last Name</th>
        </tr>
      </thead>
      <tbody>
        <tr> <!-- perfect start-->
          <td>Denis</td>
          <td>Cheung</td>
        </tr> <!-- perfect end-->
      </tbody>
    </table>
    <form id="name-form">
      <div>
        <label>First name</label>
        <input type="text" id="first-name">
      </div>
      <div>
        <label>Last name</label>
        <input type="text" id="last-name">
      </div>
      <button type="submit" id="submit-name"></button>
    </form>
  </body>
  ```
  1. `$('div > ul > li').css('color', 'red')`
  2. `$('ul > li:nth-child(2)').css('background-color', 'blue')`
  3. `$('ul:nth-child(2) > li:nth-child(4)').appendTo('ul:nth-child(1)')`
  4. `$('ul:nth-child(2)').remove()`
  5. the code as follow

    ```js
    var elements = $('ul > li')

    for (var i=0; i < elements.length; i++){
      var element = elements.eq(i);
      var originalHTML = element.html();
      var newHTML = originalHTML.split('').reverse().join('');
      element.html(newHTML);
    }
    ```
  6. `var firstName = $('#first-name').val()` and `var lastName = $('#last-name').val()`
  7. `$('tbody').append('<tr><td>Fer</td><td>Martin</td></tr>')`
  8. the code as follow

    ```js
    $('#name-form').on("submit", function (e) {
      e.preventDefault()
      var firstName = $('#first-name').val();
      var lastName = $('#last-name').val();
      var str = '<tr><td>' + firstName + '</td><td>' + lastName+ '</td></tr>';
      $('tbody').append(str);
    });
    ```
  9. There is mainly two way
     - `$('#name-form input').val('')`
     - `$('#name-form')[0].reset()`
