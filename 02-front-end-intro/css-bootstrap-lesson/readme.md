<style>
div.highlight pre {
  width: 100%;
}

code {
  background-color: #ECF0F1;
  padding: 5px;
  color: #888;
  display: inline-block;
  font-size: 20px;
} 
</style>

# Bootstrap 3
[Bootstrap](http://getbootstrap.com/) is the most popular HTML, CSS, and JS framework for developing responsive, mobile first projects on the web.

---

## Getting Started
Doctype

```html
  <!DOCTYPE html>
  <html lang="en">
    ...
  </html>
```

[Mobile First](http://getbootstrap.com/css/#overview)

```html
  <meta name="viewport" content="width=device-width, initial-scale=1">
```

[Browser and device support // screen sizes](http://getbootstrap.com/getting-started/#support)

---

#### CDN (Content Delivery Network)
- [Bootstrap CDN](http://www.bootstrapcdn.com/)
- Browser will download from the CDN's server

- **Performance increase**
  - Sam goes to `cnn.com` and downloads bootstrap from CNN's server
  - Sam then goes to `npr.com` and downloads bootstrap a **second** time from NPR's server
  - If `CNN` and `NPR` had both used the same CDN for bootstrap.css, the client would have downloaded bootstrap **once**, and loaded it from cache when they visited the second site

```html
​<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
```

---

#### Minified
- Minification ​removes spaces, extra lines, changes names of variables (`myAwesomeVariable` ==> `a`), etc in the css/js files in order to decreases file size
- Smalles file size means smaller file to send from server to client, making our websites faster!
- **Caveat**: If we use a minified version, it will be harder to debug the code of the library itself, so we should only use it in **production**

`"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"`

---

#### CSS Reset
- Bootstrap uses [normalize.css](http://necolas.github.io/normalize.css/)
- Makes browsers render all elements more consistently and in line with modern standards. It precisely targets only the styles that need normalizing.

---

## Bootstrap Grid
- What is it?
  - Positions elements on a 12-column grid system.
  - Easier responsive design
  - To start a grid you must first have containers and rows

---

## Basic Components
#### Container
- fixed-width
- has some extra room on the left and right

```html
  <div class="container">
    ...
  </div>
```

#### Container-Fluid
- full-width of the page / browser window

```html
  <div class="container-fluid">
    ...
  </div>
```

---

#### Container > Rows
- `.row` must be inside of `.container` or `.container-fluid`
- `.row` should have `.col` elements inside


```html
<div class="container">
    <div class="row">
       (columns)
    </div>
    <div class="row">
       (columns)
    </div>
</div>
```

---

#### Container > Rows > Columns
- Only a max of 12 columns will fit horizontally across a screen. If there are 14 columns, the extra two will go on a new line.
- `.row` should have `.col` inside
    - Note: the contents inside the `.col` will still want to naturally pull left

```html
<div class="container">
  <div class="row">
    <div class="col-md-6">I’m md and on the left</div>
    <div class="col-md-6">I’m md and on the right</div>
  </div>
  <div class="row">
    <div class="col-xs-6">I’m xs and on the left</div>
    <div class="col-xs-6">I’m xs and on the right</div>
  </div>
</div>
```

---

### Mobile Friendly Grid
- [Examples](http://mediaqueri.es/popular/)
- [Grid Options](http://getbootstrap.com/css/#grid-options)
- [Responsive Inspector Chrome Extension](https://chrome.google.com/webstore/detail/responsive-inspector/memcdolmmnmnleeiodllgpibdjlkbpim?hl=en)

---

#### Responsive Columns
- `.row`
    - `.col-xs-*`
        - will never stack
        - xs is for phones
    - `.col-sm-*`
        - will start stacking on tablet screens and smaller
    - `.col-md-*`
        - will start stacking on ~half-width desktop screens and smaller
    - `.col-lg-*`
        - will  start stacking on all screens ~1170px and smaller

Example - [here](https://jsbin.com/zacese/edit?html,output)

---

### Other Column Options
#### Offsets 
- increases the left margin of something
- results in columns being pushed to the right
- col + offsets can equal a max of 12 or else it'll start stacking

Example [here](https://jsbin.com/goyoli/edit?html,output)

#### Push and Pull

- Easily change the order of our built-in grid columns with `.col-md-push-*` and `.col-md-pull-*` modifier classes.

Example [here](https://jsbin.com/wayife/edit?html,output)

---

### Hiding Columns

- In some case, you want to hide columns in certain window size. For example, hiding the sidebar on small screen.

![Column Hidden Options](http://i62.tinypic.com/20b1npi.png)

---

## Typography

Examples for all of Typography [here](https://jsbin.com/tigipac/edit?html,output)

#### Headings

- All HTML headings, `<h1>` through `<h6>`are available using bootstrap using `.h1` through `.h6` classes. 

- You can also create lighter, secondary text in any heading with a generic `<small>` tag or the `.small` class.

- **Note** - Use `<h1>` first then `<h2>` then `<h3>`...etc and **never** use these tags just for the font size.

---

#### Inline Elements

```html
<p>You can use the mark tag to <mark>highlight</mark> text.</p><!-- Marked text -->

<p><del>This line of text is meant to be treated as deleted text.</del></p><!-- Deleted text -->

<p><s>This line of text is meant to be treated as no longer accurate.</s></p><!-- Strikethrough text -->

<p><ins>This line of text is meant to be treated as an addition to the document.</ins></p><!-- Inserted text -->
```

---

```html
<p><u>This line of text will render as underlined</u></p><!-- Underlined text -->

<p><small>This line of text is meant to be treated as fine print.</small></p><!-- Small text -->

<p><strong>rendered as bold text</strong></p><!-- Bold text -->

<p><em>rendered as italicized text</em></p><!-- Italics text -->
```

---

#### Alignment Classes

Easily realign text to components with text alignment classes.

```html
<p class="text-left">    Left aligned text.</p>
<p class="text-center">  Center aligned text.</p>
<p class="text-right">   Right aligned text.</p>
<p class="text-justify"> Justified text.</p>
<p class="text-nowrap">  No wrap text.</p>
```

---

#### Transformation Classes

Transform text in components with text capitalization classes.

```html
<p class="text-lowercase">  Lowercased text.</p>
<p class="text-uppercase">  Uppercased text.</p>
<p class="text-capitalize"> Capitalized text.</p>
```

---

#### Abbreviations

Stylized implementation of HTML's <abbr> element for abbreviations and acronyms to show the expanded version on hover.

```html
<abbr title="attribute">attr</abbr>
```

---

#### Addresses

Present contact information for the nearest ancestor or the entire body of work. Preserve formatting by ending all lines with `<br>`.

```html
<address>
  <strong>Twitter, Inc.</strong><br>
  1355 Market Street, Suite 900<br>
  San Francisco, CA 94103<br>
  <abbr title="Phone">P:</abbr> (123) 456-7890
</address>

<address>
  <strong>Full Name</strong><br>
  <a href="mailto:#">first.last@example.com</a>
</address>
```

---

#### Blockquotes

For quoting blocks of content from another source within your document.

```html
<blockquote>
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
</blockquote>
```

---

#### Lists

- There are `unordered list` and `ordered list`
  - Unordered Lists will appear with &#9632;, &#9633;, &#9679;, &#9675; ...etc
  - Ordered Lists will appear with `1. 2. 3.`, `i. ii. iii.`, ...etc
- You can remove list these list styles by add a class `list-unstyled`
- You can also make it display inline by adding a class `list-inline`

```html
<ul> <!-- or ol -->
  <li>a</li>
  <li>b</li>
  <li>c</li>
</ul> <!-- or ol -->
```

---

#### Description

A list of terms with their associated descriptions. `dl` is a list of description, `<dt>` is the title, `<dd>` is the actual description. 

By defaul they stack against each other. However by adding class `dl-horizontal` to `dl` you can make them display inline.

```html
<dl>
  <dt>Apple</dt>
  <dd>is a fruit</dd>
</dl>
```

---

## Tables

Template for a simple table [here](https://jsbin.com/holuhos/edit?html,output). Use this to apply different class you see later in here to see the differences.

#### Styles on Table

By default `<table>` have no styles, however in bootstrap just by adding a class `table` will make it more beautiful

| Table | Description |Classes |
|-------|---------|---------|
| **Simple Table** | Basic table | `class="table"`
| **Striped rows** | Alternate highlighting rows |`class="table table-striped"`
| **Bordered table** | Add a border | `class="table table-bordered"`
| **Hover rows** | MouseOver highlights | `class="table table-hover"`
| **Condensed table** | Compact table | `class="table table-condensed"`

---

#### Highlighting TR or TD

You can add a class to `<td>` or `<td>` to highlight them in differ colors

```html
<!-- On rows -->
<tr class="active">...</tr>
<tr class="success">...</tr>
<tr class="warning">...</tr>
<tr class="danger">...</tr>
<tr class="info">...</tr>

<!-- On cells (`td` or `th`) -->
<tr>
  <td class="active">...</td>
  <td class="success">...</td>
  <td class="warning">...</td>
  <td class="danger">...</td>
  <td class="info">...</td>
</tr>
```

---

#### Responsive Table

Sometimes when the screen is too small and there are too many columns in the table, you can add a class `table-responsive` to `<table>`'s parent element to make the table scroll horizontally.

```html
<div class="table-responsive">
  <table class="table">
    ...
  </table>
</div>
```

---

## Forms
Sample for each structure is [here](https://jsbin.com/zoxehi/edit?html,output)

---

#### Basic Form Structure
Forms in bootstrap have a basic structure rules as follow:

1. `<div class="form-group">` should **wrap around** each `<input>`
1. Each `<input>` should have class `.form-control`
1. Each `<input>` should also have `<label>`*(even if you don't want it)*. If displaying `<label>` is not desire, add a class `.sr-only`
1. Each `<label>` should also refer to name of `<input>`
1. Should, but not always, have a `<button type="submit">`

```html
<form>
  <div class="form-group">
    <label class="sr-only" for="user-email">Email</label>
    <input class="form-control" type="email" name="user-email" placeholder="Email">
  </div>
  <button class="btn btn-info" type="submit">Subscribe</button>
</form>
```

---

#### Inline Form Structure

Basic structure stack each `div.form-groupon` on top of each other. To display input side by side, add `.form-inline` class to `<form>`

```html
<form class="form-inline">
  <div class="form-group">
    <label class="" for="user-email">Email</label>
    <input class="form-control" type="email" name="user-email" placeholder="Email">
  </div>

  <div class="form-group">
    <label class="" for="user-password">Passowrd</label>
    <input class="form-control" type="password" name="user-password" placeholder="Password">
  </div>

  <button class="btn btn-info" type="submit">Login</button>
</form>
```

---

#### Horizontal Form Structure

Horizontal is similar to basic structure. However, instead of `<label>` and `<input>` stack on top of each other, they will display inline.

Use `.form-horizontal` class on `<form>`. 

Checkout next slide to see the structure **or** see the sample link [here](https://jsbin.com/zoxehi/edit?html,output) 

---

```html
<form class="form-horizontal">
  <div class="form-group">
    <label class="col-xs-2" for="user-email">Email</label>
    <div class="col-xs-10">
      <input class="form-control" type="email" name="user-email" placeholder="Email">
    </div>
  </div>

  <div class="form-group">
    <label class="col-xs-2" for="user-password">Passowrd</label>
    <div class="col-xs-10">
      <input class="form-control" type="password" name="user-password" placeholder="Password">
    </div>
  </div>

  <button class="btn btn-info" type="submit">Login</button>
</form>
```

---

#### Options

You can put icon at the beginning or after the `<input>`

```html
<form>
  <div class="form-group">
    <label class="" for="user-Price">Price</label>
    <div class="input-group">
      <span class="input-group-addon">$</span>
      <input class="form-control" type="number" name="user-price" placeholder="Price">
      <span class="input-group-addon">.00</span>
    </div>
  </div>
</form>
```

---

#### Input States

| State | Description | Code |
|-------|-------------|------|
| Disabled | Disable Input with a special mouse cursor | `<input type="text" disabled>`|
| Readonly | Prevent modification with normal mouse cursor | `<input type="text" readonly>` |
| Focused | Applied automatically by browser | no code needed |

---

#### Help Text / Hint / Description
By adding a `<p class="help-block">` or `<span class="help-block">` inside a `.form-group`, it will provide a small text to add help / hint / description for that specific `.form-group`

```html
<form>
  <div class="form-group">
    <label for="user-email">Email</label>
    <input class="form-control" type="email" name="user-email" placeholder="Email">
    <p class="help-block">By subscribing, we will spam you!</p>
  </div>
  <button class="btn btn-info" type="submit">Subscribe</button>
</form>
```

---

#### Intput Validation

Bootstrap includes validation styles for error, warning, and success states on form controls

To use, add `.has-warning`, `.has-error`, or `.has-success` to the `.form-group`

---

#### Intput Validation

```html
<div class="form-group has-success">
  <label class="control-label" for="inputSuccess1">Input with success</label>
  <input type="text" class="form-control" id="inputSuccess1" aria-describedby="helpBlock2">
</div>
<div class="form-group has-warning">
  <label class="control-label" for="inputWarning1">Input with warning</label>
  <input type="text" class="form-control" id="inputWarning1">
</div>
<div class="form-group has-error">
  <label class="control-label" for="inputError1">Input with error</label>
  <input type="text" class="form-control" id="inputError1">
</div>
```

---

#### Validation with Icons

You can also have stylish icon for validation.

```html
<form>
  <div class="form-group has-success has-feedback">
    <label class="control-label" for="inputSuccess1">Input with success</label>
    <div class="input-group">
      <span class="input-group-addon">$</span>
      <input type="text" class="form-control" id="inputSuccess1" aria-describedby="helpBlock2">
    </div>
    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
  </div>
</form>
```

---

## Buttons
#### Beautifying Button
You can beautify button from it's original *window 95* style button by adding a class `.btn`

You can apply this class to `<a>`, `<button>`, and `<input>`

```html
<a class="btn btn-default" href="#" role="button">Link</a>
<button class="btn btn-default" type="submit">Button</button>
<input  class="btn btn-default" type="button" value="Input">
<input  class="btn btn-default" type="submit" value="Submit">
```

---

#### Colors

Use any of the available button classes to quickly create a styled button.

```html
<button type="button" class="btn btn-default"> Default </button>
<button type="button" class="btn btn-primary"> Primary </button>
<button type="button" class="btn btn-success"> Success </button>
<button type="button" class="btn btn-info">    Info    </button>
<button type="button" class="btn btn-warning"> Warning </button>
<button type="button" class="btn btn-danger">  Danger  </button>
<button type="button" class="btn btn-link">    Link    </button>
```

---

#### Size

Fancy larger or smaller buttons? Add `.btn-lg`, `.btn-sm`, or `.btn-xs` for additional sizes.

```html
<button type="button" class="btn btn-default">        Default button</button>
<button type="button" class="btn btn-default btn-sm"> Small button</button>
<button type="button" class="btn btn-default btn-xs"> Extra small button</button>
<button type="button" class="btn btn-default btn-lg"> Large button</button>

```

---

#### Full Width
Create block-level buttons *(span the full width of a parent)* by adding `.btn-block`.

```html
<button type="button" class="btn btn-default btn-lg btn-block">Block level button</button>
```

---

## Images

#### Responsive Images
Make images responsive with `.img-responsive` class that **scales nicely to the parent element**. 

```html
<img src="..." class="img-responsive" alt="Responsive image">
```

> In IE 8-10, SVG images are disproportionately sized. Add `width: 100% \9;` to fix.
>
> **This is why [IE sucks](https://www.change.org/p/discontinue-internet-explorer) and should be destroyed from the face of earth**

---

#### Image Shapes
Add classes to an `<img>` element to easily style images in any project.

Keep in mind that Internet Explorer 8 lacks support for rounded corners. 

```html
<img src="..." alt="..." class="img-rounded">
<img src="..." alt="..." class="img-circle">
<img src="..." alt="..." class="img-thumbnail">
```

---

## Helper Classes
#### Colors
There are 5 primary colors in Bootstrap `primary`, `success`, `info`, `warning`, and `danger`

You can combine them with different words to change properties to different color.

|        Description         |    Class        |
|----------------------------|-----------------|
| apply color to text        |`class="text-*"` |
| apply color to background  |`class="bg-*"`   |
| apply color to button      |`class="btn-*"`  |

---

```html
<p class="text-primary">...</p>
<p class="text-success ">...</p>
<p class="text-info">...</p>
<p class="text-warning">...</p>
<p class="text-danger">...</p>
```

```html
<p class="bg-primary">...</p>
<p class="bg-success ">...</p>
<p class="bg-info">...</p>
<p class="bg-warning">...</p>
<p class="bg-danger">...</p>
```

---

#### Alignment
There is a class for you to applly `float: left;` and `float:right`. 

Apply class `.pull-left` and `.pull-right`

```html
<div class="pull-left">...   </div> <!-- float: left; -->
<div class="pull-right">...  </div> <!-- float: right; -->
<div class="center-block">...</div> <!-- display: block; margin-left: auto; margin-right: auto; -->
<div class="clearfix">...    </div> <!-- clear: both; -->
```
