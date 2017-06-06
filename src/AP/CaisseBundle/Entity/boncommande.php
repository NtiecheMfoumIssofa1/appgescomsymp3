<?php

namespace AP\CaisseBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * boncommande
 *
 * @ORM\Table(name="boncommande")
 * @ORM\Entity(repositoryClass="AP\CaisseBundle\Repository\boncommandeRepository")
 */
class boncommande
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime")
     */
    private $date;

    /**
     * @var bool
     *
     * @ORM\Column(name="annule", type="boolean")
     */
    private $annule;


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set date
     *
     * @param \DateTime $date
     *
     * @return boncommande
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set annule
     *
     * @param boolean $annule
     *
     * @return boncommande
     */
    public function setAnnule($annule)
    {
        $this->annule = $annule;

        return $this;
    }

    /**
     * Get annule
     *
     * @return bool
     */
    public function getAnnule()
    {
        return $this->annule;
    }
}

