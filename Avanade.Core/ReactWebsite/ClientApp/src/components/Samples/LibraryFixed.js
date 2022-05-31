import { Alert } from 'reactstrap';
import React, { Fragment } from 'react';

const LibraryFixed = () => {

    const books = [
        {
            id: 1,
            name: 'Lord of the Rings',
            author: 'Tolkien',
        },
        {
            id: 2,
            name: 'Harry Potter',
            author: 'Rowling',
        },
        {
            id: 3,
            name: 'Falls of Kings',
            author: 'David Gemel',
        }
    ];

    return (

        <Fragment>
            <Alert variant="success">
                <p>
                    Fixed list of books in Library
                </p>
                <hr />
            </Alert>

            {books.map((book) =>
                <BookDisplay
                    key={book.id}
                    name={book.name}
                    author={book.author}
                />
            )}

        </Fragment>

    );
};
export default LibraryFixed;

const BookDisplay = (props) => {

    return (
        <div>
            <h3>Book name: {props.name}</h3>
            <p><b>Author name: {props.author}</b></p>
        </div>
    );
}