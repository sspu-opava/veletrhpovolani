<?php

namespace AdminModule;

use App\Forms;
use Nette\Application\UI\Form;
use App\Model\ArticleManager;
use Tracy\Debugger;

final class ArticlePresenter extends BasePresenter
{
    private $articleManager;
	/** @var Forms\ArticleFormFactory */
	private $articleFactory;


    public function __construct(ArticleManager $articleManager, Forms\ArticleFormFactory $articleFactory) {
        $this->articleManager = $articleManager;
        $this->articleFactory = $articleFactory;
    }

	/**
	 * article form factory.
	 * @return Form
	 */
	protected function createComponentArticleForm()
	{
		return $this->articleFactory->create(function () {
            $this->flashMessage("Záznam byl úspěšně upraven");
			$this->redirect(':Admin:Article:admin');
		});
	}

    public function actionDelete($id) {
        $data = $this->articleManager->delete($id); 
        $this->flashMessage("Záznam byl úspěšně smazán");
        $this->redirect(':Admin:Article:admin');
}

    public function renderDefault() {
	    $this->template->list = $this->articleManager->readAll();
    }
    
    public function renderAdmin($order = ArticleManager::COLUMN_ID) {
        Debugger::log($order);
	    $this->template->list = $this->articleManager->readAll($order);
        Debugger::barDump($this->template->list);
    }

    public function renderView($id) {
	    $this->template->row = $this->articleManager->readOne($id);
    }

    public function renderInsert() {
    }    

    public function renderUpdate($id) {
        Debugger::barDump($this->getUser());
        $this->template->uzivatel = $this->user->getIdentity()->username;
        $data = $this->articleManager->readOne($id);
        $data = $data->toArray();
        $this['articleForm']->setDefaults($data);
    }    
}
