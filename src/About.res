@react.component
let make = () => {
  let (count, setCount) = React.useState(() => 0)

  let increaseCount = React.useCallback(() => {
    setCount(count => count + 1)
    Js.log("Clicking button")
  })

  <div>
    <div>{"About page"->React.string}</div>
    <button className="px-2 py-1 rounded bg-gray-100 border border-gray-500" onClick={_ => increaseCount()}>{`Counter: ${count->Int.toString}`->React.string}</button>
  </div>
}

let default = make