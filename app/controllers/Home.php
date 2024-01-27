<?php
//HomeController Controller
class Home extends Controller
{

    public $data = [], $model = [];

    public function __construct()
    {
        //construct
    }

    public function index()
    {
        $user = $this->model("categories");
        $dataCategories = $user->getAllCategories();
        $this->data['content'] = 'home/welcome';
        $this->data['sub_content']['dataCategories'] = $dataCategories;

        $this->render('layouts/client_layout', $this->data);
    }

    
    
}
