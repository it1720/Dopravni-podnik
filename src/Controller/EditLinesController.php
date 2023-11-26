<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class EditLinesController extends AbstractController
{
    #[Route('/edit/lines', name: 'app_edit_lines')]
    public function index(): Response
    {
        $lines = ["1", "2", "3"];
        $zastavky = ["Ratiborska", "Vrchni", "Pekarska"];
        return $this->render('edit_lines/index.html.twig', [
            'controller_name' => 'EditLinesController',
            'lines' => $lines,
            'zastavky'  => $zastavky,
        ]);
    }
}
