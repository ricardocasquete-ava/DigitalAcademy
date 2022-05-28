import React, { Fragment, useState, useEffect } from 'react';
import { Container, Jumbotron, Row, Col, Image, Media } from 'reactstrap';

import avaLogo from './../resources/images/avaLogo.png';

const Day1 = (props) => {

    const [weatherResults, setWeatherResults] = useState();

    const weatherList = weatherResults?.map((weather) => {
        return (
            <tr>
                <td>{weather.date}</td>
                <td>{weather.temperatureC}</td>
                <td>{weather.summary}</td>
            </tr>
        )
    })

    useEffect(() => {
        const weatherForecast = 'https://localhost:7016/WeatherForecast';
        fetch(weatherForecast)
            .then((res) => res.json())
            .then((weather) => {
                setWeatherResults(weather);
            });
    }, []);

    return (
        <Fragment>
            <h2> Weather Report </h2>
            <table>
                <tr>
                    <th>date</th>
                    <th>temperatureC</th>
                    <th>summary</th>
                </tr>
                {weatherList}
            </table>

        </Fragment>
    );
};
export default Day1;