import React, { Fragment, useState } from 'react';
import { Button } from 'reactstrap';

const PropsSample = () => {

    const [tileCount, setTileCount] = useState(1);
    const [tiles, setTiles] = useState(['a','b']);

    return (
        <Fragment>

            <div>
                Number of Tiles is {tileCount}
            </div>

            <div>
                <Button color="success" onClick={() => setTileCount(tileCount + 1)}>
                    Add Tiles
                </Button>
            </div>

            {tiles.map((item, index) => ( <Tile /> )) }

        </Fragment>
    );
};
export default PropsSample;

const Tile = (props) => {

    return (
        <div>
            Tile
        </div>
    );
};





const Library = () => {

    const books = [
        {
            name: 'Pride and Prejudice',
            author: 'Jane Austen',
            id: 1
        },
        {
            name: 'The Great Gatsby',
            author: ' F. Scott Fitzgerald',
            id: 2
        },
    ];

    return (

        <div>
            {books.map((book) =>
                <Booksdata
                    key={book.id}
                    name={book.name}
                    author={book.author}
                />
            )}
        </div>
    );
};

const Booksdata = (props) => {

    return (
        <div >
            <h3>Book name: {props.name}</h3>
            <p>genre: {props.genre}</p>
            <p>Author name: {props.author}</p>
            <p>Year published : {props.year_published}</p>
        </div>
    );
}