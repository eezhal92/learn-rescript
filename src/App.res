@module("./logo.svg") external logo: string = "default"
%%raw(`import './App.css'`)

type todo = {
  title: string,
  isDone: bool
}

type state = {todoList: array<todo>, inputValue: string}

let initialState: state = {
  todoList: [],
  inputValue: "",
}

type actions = AddTodo | ClearTodos | InputChanged(string) | MarkDone(int)

let reducer = (state: state, action: actions) => {
  switch action {
  | AddTodo => {
      inputValue: "",
      todoList: state.todoList->Js.Array2.concat([
        {
          title: state.inputValue,
          isDone: false,
        },
      ]),
    }
  | ClearTodos => {
      ...state,
      todoList: [],
    }
  | InputChanged(newValue) => {
      ...state,
      inputValue: newValue,
    }
  | MarkDone(index) => {
      ...state,
      todoList: state.todoList->Belt.Array.mapWithIndex((i, todo) => {
        if i == index {
          {
            ...todo,
            isDone: !todo.isDone,
          }
        } else {
          todo
        }
      }),
    }
  }
}

@react.component
let make = () => {
  let (state, dispatch) = React.useReducer(reducer, initialState)
  let (count, setCount) = React.useState(() => 0)

  let handleInput = e => {
    let text: string = ReactEvent.Form.target(e)["value"]

    text->InputChanged->dispatch
  }
  <div className="App">
    <button style={ReactDOM.Style.make(~borderRadius = "4px", ~padding="4px 8px", ~border="1px solid #ccc", ())} onClick={_ => setCount(count => count + 1)}>{"Click: "->React.string} {`${count->Js.Int.toString}`->React.string}</button>
    <br />
    <br />

    <input style={ReactDOM.Style.make(~border="1px solid #000", ())} value={state.inputValue} type_="text" onChange={handleInput} />
    <button onClick={_ => AddTodo->dispatch}>{"Add"->React.string}</button>
    <button onClick={_ => ClearTodos->dispatch}>{"Clear"->React.string}</button>

    {state.todoList->Belt.Array.mapWithIndex((i, todo: todo) => {
      <Todo key={todo.title} title={todo.title} isDone={todo.isDone} onClick={_ => i->MarkDone->dispatch} />
    })->React.array}
    
  </div>
}
