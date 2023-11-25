<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class EditUsersController extends AbstractController
{
    #[Route('/edit/users', name: 'app_edit_users')]
    public function index(): Response
    {
        $users = ["Tomas", "Matej", "David"];
        return $this->render('edit_users/index.html.twig', [
            'controller_name' => 'EditUsersController',
            'users' => $users,
        ]);
    }
}
