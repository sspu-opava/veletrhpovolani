<?php

namespace App\Forms;

use App\Model;
use Nette;
use Nette\Application\UI\Form;
use Nette\Security\User;
use Tracy\Debugger;


final class ArticleFormFactory
{
	use Nette\SmartObject;

	/** @var FormFactory */
	private $factory;

	/** @var Model\ArticleManager */
	private $articleManager;

	/** @var User */
	private $user;
	

	public function __construct(FormFactory $factory, Model\ArticleManager $articleManager, User $user)
	{
		$this->factory = $factory;
		$this->articleManager = $articleManager;
		$this->user = $user;
		Debugger::barDump($this->user->getIdentity());
		Debugger::barDump($this->articleManager);
	}


	/**
	 * @return Form
	 */
	public function create(callable $onSuccess)
	{
		$form = $this->factory->create();
		$form->addHidden('idarticle');
		$form->addText('title', 'Titulek')
			->setRequired('Zadejte, prosím, titulek.');

		$form->addTextArea('content', 'Obsah')
			->setRequired('Zadejte, prosím, obsah.')
			->setAttribute('rows',10);

	/*	$category = [
			'studium' => 'studium',
			'zaměstnání' => 'zaměstnání',
			'zábava' => 'zábava',
		];	
		$form->addSelect('category', 'Rubrika', $category)
			->setDefaultValue('studium');*/

		$form->addSubmit('submit', 'Potvrdit');

		$form->onSuccess[] = function (Form $form, $values) use ($onSuccess) {
			$values['author_id'] = $this->user->id;
			if ($values['idarticle']) {
				$this->articleManager->update($values['idarticle'], $values);
			} else {
				$this->articleManager->insert($values);
			}
			$onSuccess();
		};

		return $form;
	}
}
