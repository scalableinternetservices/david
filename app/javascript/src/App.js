import React from 'react';
import axios from 'axios';
import { useForm } from 'react-hook-form';
import './App.css';

const App = () => {
  const [articles, setArticles] = React.useState([]);
  const [titleError, setTitleError] = React.useState();
  const { register, handleSubmit, formState: { errors } } = useForm();
  console.log(errors);

  const fetchArticles = async () => {
    const { data } = await axios.get('/api/articles');
    setArticles(data);
  }

  React.useEffect(() => {
    fetchArticles();
  }, [])

  const isValid = ({ title, url }) => {
    let valid = true;
    if (title.length < 5) {
      valid = false;
      setTitleError('Make the title at least 5 characters');
    }

    return valid;
  }

  const submit = async ({ title, url }) => {
    if (!isValid({ title, url })) return;

    await axios.post('/api/articles', { title, url });
    fetchArticles();
  }

  return (
    <div>
      <table className="table">
        <thead>
          <tr>
            <th>Title</th>
            <th>Url</th>
          </tr>
        </thead>

        {articles.map((article) => (
          <tr>
            <td><a href={article.url}>{article.title}</a></td>
            <td>{article.url}</td>
            <td style={{ maxWidth: 200 }}><img src={article.title} /></td>
          </tr>
        ))}
      </table>


      <form onSubmit={handleSubmit(submit)}>
        <label htmlFor='title'>Title</label>
        <input className='form-control' type="title" placeholder="title" {...register('title')} />
        <p style={{ color: 'red' }}>{titleError}</p>
        <label htmlFor='url'>Url</label>
        <input className='form-control' type="url" placeholder="url" {...register("url")} />


        <input type="submit" />
      </form>
      {/* <form onSubmit={submit}>

        <label htmlFor='title'>Title</label>
        <input
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          onBlur={() => isValid()}
          id="title"
          name="title"
          className="form-control"
        />
        <p style={{ color: 'red' }}>{titleError}</p>

        <label htmlFor='url'>Url</label>
        <input
          value={url}
          onChange={(e) => setUrl(e.target.value)}
          id="url"
          name="url"
          className="form-control"
        />
        {/* <%= form.input :title, input_html: { class: 'form-control' }, wrapper_html: { class: 'form-group' } %>
        <%= form.input :url, input_html: { class: 'form-control' }, wrapper_html: { class: 'form-group' } %> */}
    </div>
  )
};
export default App;
