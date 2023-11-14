
type todo = {
  id: string,
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
          id: Js.Math.random()->Float.toString,
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
  
  let handleSubmit = e => {
    e->ReactEvent.Form.preventDefault
    
    if state.inputValue != "" {
      AddTodo->dispatch
    }
  }

  let handleInput = e => {
    let text: string = ReactEvent.Form.target(e)["value"]

    text->InputChanged->dispatch
  }
  <div className="todo-list">
    <div className="bg-a-dark-1 p-8">
      <div className="flex justify-center items-center">
        <h1 className="inline-block text-a-orange px-4 font-bold">{"refsah"->React.string}</h1>
        <form onSubmit={handleSubmit}>
          <input name="text" className="bg-a-dark-2 text-white px-3 py-2 rounded-s-md" value={state.inputValue} type_="text" onChange={handleInput} />
          <button type_="submit" className="bg-a-dark-2 text-white px-3 py-2  rounded-e-md" style={ReactDOM.Style.make(~marginLeft="1px", ())}>{"Add"->React.string}</button>
        </form>
        <span className="ml-2 underline text-white"><Link text="Go to google" href="https://google.com" blank=true /></span>
      </div>
    </div>
    
    <div className="flex flex-col" style={ReactDOM.Style.make(~width="978px", ~margin="0px auto",())}>

    <div className="flex justify-end my-4">
      <button className="px-2 py-1 bg-white rounded border border-gray-100" onClick={_ => ClearTodos->dispatch}>{"Clear"->React.string}</button>
    </div>

    <div className=" bg-gray-100 px-6 py-4 ">
      {Js.Array.length(state.todoList) == 0 ? <p>{"List is empty"->React.string}</p> : React.null}
      {state.todoList->Belt.Array.mapWithIndex((i, todo: todo) => {
        <div key={todo.id} className={i == 0 ? "" : "mt-2"}>
          <Todo title={todo.title} isDone={todo.isDone} onClick={_ => i->MarkDone->dispatch} />
        </div>
      })->React.array}
    </div>

    <ReactRouterDom.Outlet />
    </div>
  </div>
}
