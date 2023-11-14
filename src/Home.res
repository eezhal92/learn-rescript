%%raw(`import './App.css'`)


@react.component
let make = () => {
  
  <div className="App">
    <div className="bg-black p-4">
      <span className="text-white p-2"><ReactRouterDom.Link to={"/"}>{"Home"->React.string}</ReactRouterDom.Link></span>
      <span className="text-white p-2"><ReactRouterDom.Link to={"/about"}>{"About"->React.string}</ReactRouterDom.Link></span>
    </div>

    <ReactRouterDom.Outlet />
  </div>
}
