<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class LoginController extends AbstractController
{
    #[Route('/login', name: 'login')]
    public function index(): Response
    {
        $users = ["Tomas", "Matej", "David"];

        return $this->render('login/index.html.twig', [
            'controller_name' => 'LoginController',
            'users' => $users,
        ]);
    }
}
