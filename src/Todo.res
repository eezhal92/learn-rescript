@react.component
let make = (~onClick, ~title: string, ~isDone: bool) => {
  <div onClick style={
    ReactDOM.Style.make(~textDecoration= isDone ? "line-through" : "initial", ())
  }>
    {React.string(">" ++ title)}
  </div>
}

let default = make