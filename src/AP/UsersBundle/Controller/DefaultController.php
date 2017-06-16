<?php

namespace AP\UsersBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('APUsersBundle:Default:index.html.twig');
    }
}
