# ERB Helper | Atom Package

ERB Helper makes it easy to insert and wrap ERB tags with Atom.

## Usage

| Command Name | ERB Value   | Key Binding            |
|--------------|-------------|------------------------|
| ERB Output   | <%=  %>     | ```CTRL + SHIFT + .``` |
| ERB Eval     | <%  %>      | ```CTRL + .```         |
| ERB Comment  | <%#  %>     | ```CTRL + SHIFT + 3``` |
| ERB End      | <% end %>   | ```CTRL + 8```         |
| ERB If       | <% if %>    | ```CTRL + 7```         |
| ERB Else     | <% else %>  | ```CTRL + 6```         |
| ERB Elsif    | <% elsif %> | ```CTRL + SHIFT + 6``` |

You can also find the commands in the Right Click context menu.

If you select some text before executing a command the text will be wrapped with the
appropriate tag.

## Installation

Install from the Atom Package manager or the command line:


```$ apm install erb-helper```

## Contributions

Contributions are welcome, just create a pull request.

If there is a feature that you'd like to see added to the package
just open a new issue.
