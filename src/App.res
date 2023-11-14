open ReactRouterDom

let routes: array<routeObject> = [
  {
    path: "/",
    element: <Home />, 
    children: [
      { path: "/", element: <TodoList /> },
      { path: "/about", element: <About /> }
    ] 
  }
]
let router = createBrowserRouter(~routes = routes)

@react.component
let make = () => {
  <RouterProvider router={router} />
}