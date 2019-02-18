<?php

namespace App\Model;

use Nette;

/**
 * Users management.
 */
final class ArticleManager {

    use Nette\SmartObject;

    const
            TABLE_NAME = 'article',
            COLUMN_ID = 'idarticle',
            COLUMN_TITLE = 'title',
            COLUMN_SUBTITLE = 'subtitle',
            COLUMN_LEAD = 'lead',
            COLUMN_CONTENT = 'content',
            COLUMN_EDITED = 'edited',
            COLUMN_PUBLISHED = 'published',
            COLUMN_AUTHOR_ID = 'author_id';

    /** @var Nette\Database\Context */
    private $database;

    public function __construct(Nette\Database\Context $database) {
        $this->database = $database;
    }

    public function readAll($order = self::COLUMN_PUBLISHED.' DESC') {
        return $this->database->table(self::TABLE_NAME)->order($order)->fetchAll();
    }

    public function readAllByLimit($limit = 0, $order = self::COLUMN_PUBLISHED.' DESC') {
        return ($limit > 0) ? $this->database->table(self::TABLE_NAME)->order($order)->limit($limit)->fetchAll() : $this->database->table(self::TABLE_NAME)->order($order)->fetchAll();
    }

    public function readOne($id) {
        return $this->database->table(self::TABLE_NAME)->get($id);
    }

    public function insert($values) {
        $this->database->table(self::TABLE_NAME)->insert($values);
    }

    public function update($id, $values) {
        $this->database->table(self::TABLE_NAME)->get($id)->update($values);
    }

    public function delete($id) {
        $this->database->table(self::TABLE_NAME)->get($id)->delete();
    }

}
