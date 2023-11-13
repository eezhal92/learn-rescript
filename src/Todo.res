@react.component
let make = (~onClick, ~title: string, ~isDone: bool) => {
  <div className="px-3 py-2 border bg-white w-full block border-grey-100" onClick style={
    ReactDOM.Style.make(~textDecoration= isDone ? "line-through" : "initial", ())
  }>
    {React.string(">" ++ title)}
  </div>
}

let default = make