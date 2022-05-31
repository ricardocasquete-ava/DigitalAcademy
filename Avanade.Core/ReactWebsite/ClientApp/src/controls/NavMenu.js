import React, { Component } from 'react';
import { Collapse, Container, DropdownItem, DropdownMenu, Navbar, NavbarBrand, NavbarToggler, NavItem, NavLink, DropdownToggle, UncontrolledDropdown  } from 'reactstrap';
import { Link } from 'react-router-dom';
import './../resources/css/NavMenu.css';

export class NavMenu extends Component {
  static displayName = NavMenu.name;

  constructor (props) {
    super(props);

    this.toggleNavbar = this.toggleNavbar.bind(this);
    this.state = {
      collapsed: true
    };
  }

  toggleNavbar () {
    this.setState({
      collapsed: !this.state.collapsed
    });
  }

  render () {
      return (
          <header>
              <Navbar className="navbar-expand-sm navbar-toggleable-sm ng-white border-bottom box-shadow mb-3" light>
                  <Container>

                      <NavbarBrand tag={Link} to="/">Home</NavbarBrand>

                      <NavbarToggler onClick={this.toggleNavbar} className="mr-2" />
                      <Collapse className="d-sm-inline-flex flex-sm-row-reverse" isOpen={!this.state.collapsed} navbar>
                          <ul className="navbar-nav flex-grow">

                              <NavItem>
                                  <NavLink tag={Link} className="text-dark" to="/HelloWorld">Hello World</NavLink>
                              </NavItem>

                              <NavItem>
                                  <NavLink tag={Link} className="text-dark" to="/Counter">Counter</NavLink>
                              </NavItem>

                              <NavItem>
                                  <NavLink tag={Link} className="text-dark" to="/PropsSample">Props Sample</NavLink>
                              </NavItem>

                              <NavItem>
                                  <NavLink tag={Link} className="text-dark" to="/Calculator">Calculator</NavLink>
                              </NavItem>

                              <NavItem>
                                  <NavLink tag={Link} className="text-dark" to="/LibraryFixed">Library Fixed</NavLink>
                              </NavItem>

                              <NavItem>
                                  <NavLink tag={Link} className="text-dark" to="/LibraryDynamic">Library Dynamic</NavLink>
                              </NavItem>

                              <NavItem>
                                  <NavLink tag={Link} className="text-dark" to="/Products">Products</NavLink>
                              </NavItem>

                          </ul>
                      </Collapse>
                  </Container>
              </Navbar>
          </header>
      );
  }
}

