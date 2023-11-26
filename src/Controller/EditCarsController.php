<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class EditCarsController extends AbstractController
{
    #[Route('/edit/cars', name: 'app_edit_cars')]
    public function index(): Response
    {
        $spz = ["4T5 8405", "5E4 8765", "8M4 5213"];
        return $this->render('edit_cars/index.html.twig', [
            'controller_name' => 'EditCarsController',
            'spz' => $spz,
        ]);
    }
}
