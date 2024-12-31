# Types in React


### FC

1. Type specifically to define functional types in React.
2. Not used much these days as implicit children prop removed.

```
interface SomeComponentProps {
  title: string;
  children?: React.ReactNode;
}

export const SomeComponent: React.FC<SomeComponentProps> = ({ title, children }) => {
  return (
    <article>
      <h2>{title}</h2>

      {children}
    </article>
  );
};
```


### ElementType

- Broad type which refers to any component type which can be rendered by React.


## Links


1. https://dev.to/itswillt/explaining-reacts-types-940
2. https://www.emizentech.com/blog/types-of-react-components.html
3. https://react-typescript-cheatsheet.netlify.app/docs/basic/getting-started/function_components


### create-react-app



### React Returns

- Only single top level HTML can be returned from a React component.
	- It makes `Reconciliation` easy.