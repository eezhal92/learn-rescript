@react.component
let make = (~href: string, ~text: string, ~blank: option<bool> = ?) => {
    let target = switch blank {
        | None => ""
        | Some(_) => "_blank"
    }
    <a href={href} target={target}>{text->React.string}</a>
}

let default = make