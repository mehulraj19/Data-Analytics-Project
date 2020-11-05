# Data-Analytics-Project

This is Data Analytics Project that I have worked on. The whole project has been divided into different sections in order to keep the reviews evaluation simple. The whole project 
is implemented using 'R' programming language. The dataset contains nearly about 40000 rows and 20 columns in total. This can be found in <a href="https://www.kaggle.com/jealousleopard/goodreadsbooks">here</a>.

<h1>Working</h1>
Whenver we are talking about books and reading them, we have two types of customers in general:
<ul>
  <li><ins>Those who want to start reading<ins>: When we are talking about this class, these people will either going to ask their friend to refer a book or they will search online</li>
  <li><ins>Those who have the habit of reading</ins>: People of this class, has predifined priorities, like which author or book to read.</li>
</ul>
<br/>
I have made the overall search network in such a way that it actuallu covers the interests of both of these customers.
<h1>Models</h1>
So for the overall functioning, three models have been setup:
<ol>
  <li><h3>Data Pre-Processing</h3>
  Firstly, I have choosen the columns that are actually that is important for the overall building of the model. After doing this, I got to know that some data pre-processing was
  actually required. Like, when we are talking about the ratings column that you will see in the dataset, the format that the dataset has given can not be directly used for the
  functioning, so we actually need to extract the data from these columns. Similarly needs to be done for 'Total-Ratings' column.
  </li>
<li>
  <h3>Model1</h3>
  Here, we have actually implemented on how we can actually ectract the data from the dataset when we have differnt filters to work on. Example, if the user is giving the name of
  the author, than the search engine must show the books of that particular author.
</li>
<li>
  <h3>Model2</h3>
  For this, we need to understand how google search engine keeps the search optimised. One of the algorithms it uses is that it prioritises the urls that actually been selected by
  most of the people and keep them above others. Similar kind of working has been implemented for Model2, here whenever a customer selects a book, after giving search filters, that
  particular book must come before other books for the next customer.
</li>
<li>
  <h3>Model3</h3>
  After all this has been done, it is now time to understand how a customer actually search for a book. After reading different resources, I got to know that the general 
  behaviour of a customer buying a book is:
  <ul>
    <li>Name of the Book</li>
    <li>Name of the Author</li>
    <br/> These 2 filters are generally for those people who have the habit of reading or people askign their friends to refer them a book.
    <li>Rating of the book (generally, they chose books to have average rating > 4)</li>
    <li>Number of reviews for the Book</li>
    <li>Number of pages in the book (since, people who want to start with a book normally do not want to start with books having pages less than 200).</li>
  </ul>
  <br/> All this has been kept in mind. All the filtering methods are implemented in this order only and then this part has been integrated with model2.
</li>
<li>
 <h3>Visualization</h3>
 After implementation of model comes proper visualization. For this, I have plotted different graphs to make customer feasible to understand the backend part of the book.
 Example, When we are talk about ratings, most of the platforms like Flipkart, Amazon, uses histogram to show ratings of the book. Same has been implemented in the model.
 <br/> Another interesting thing that I have came accross was that for all the publish years, same numbers of books have been given in the dataset.
</li>
</ol>
<h1>Conclusion</h1>
In the end, this dataset has actually covered all the points that we need to work with when we are making project for 'Data Analytics'. The project has been challenging and
interesting to work on. I have learnt many different functions in R programming language and understood the basic psychological aspect for a person while buying a book. I have
also came accross some of the algorithms that Google uses for recommendations and found them really handful and I have enjoyed trying implement one of these as a small protoype.
