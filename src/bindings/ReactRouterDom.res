type remixRouter = {}

type rec routeObject = {
  path: string,
  element: React.element,
  children?: array<routeObject>
}

@module("react-router-dom")
external createBrowserRouter: (~routes: array<routeObject>) => remixRouter = "createBrowserRouter"

module RouterProvider = {
  @module("react-router-dom") @react.component
  external make: (~router: remixRouter) => React.element = "RouterProvider"
}

module Outlet = {
  @module("react-router-dom") @react.component
  external make: () => React.element = "Outlet"
}

module Link = {
  @module("react-router-dom") @react.component
  external make: (~children: React.element, ~to: string) => React.element = "Link"
}