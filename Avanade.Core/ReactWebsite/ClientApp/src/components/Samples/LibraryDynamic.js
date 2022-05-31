import { Alert, Button } from 'reactstrap';
import React, { Fragment, useState } from 'react';

const LibraryDynamic = () => {

    const [bookName, setBookName] = useState('');
    const [bookAuthor, setBookAuthor] = useState('');

    const [bookCollection,setBookCollection] = useState([]);

    const addBookToCollection = () => {
        let newBook = { name: bookName, author: bookAuthor };
        setBookCollection(book => [...book, newBook]);

        setBookName('');
        setBookAuthor('');
    };

    const handleNameChange = e => {
        setBookName(e.target.value);
    };

    const handleAuthorChange = e => {
        setBookAuthor(e.target.value);
    };

    return (

        <Fragment>

            <div className="container">
                <div className="Row">
                    <div className="Col">
                        Title
                    </div>
                    <div className="Col">
                        <input type="text" placeholder="Book Name" value={bookName} onChange={handleNameChange} />
                    </div>
                </div>
                <div className="Row">
                    <div className="Col">
                        Author
                    </div>
                    <div className="Col">
                        <input type="text" placeholder="Author of the Book" value={bookAuthor} onChange={handleAuthorChange} />
                    </div>
                </div>
                <div className="Row">
                    <div className="Col">
                        <Button onClick={addBookToCollection}>Add Book</Button>
                    </div>
                </div>
            </div>

            <Alert variant="success">
                <p>
                    Dynamic list of books in Library
                </p>
                <hr />
            </Alert>

            {bookCollection.map(book => <BookDisplay
                key={book.name}
                name={book.name}
                author={book.author}
            />)}

        </Fragment>

    );
};
export default LibraryDynamic;

const BookDisplay = (props) => {

    return (
        <div>
            <h3>Book name: {props.name}</h3>
            <p><b>Author name: {props.author}</b></p>
        </div>
    );
}