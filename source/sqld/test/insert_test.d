
module sqld.test.insert_test;

version(unittest):

import sqld.ast;
import sqld.insert_builder;
import sqld.test.test_visitor;

@system unittest
{
    auto v = new TestVisitor;
    auto u = table("users");
    auto b = InsertBuilder.init;

    b.into(u, ["active", "banned"])
     .values(true, false)
     .returning(u["id"])
     .accept(v);

    assert(v.sql.squish == q{
        INSERT INTO
          users(active, banned)
        VALUES
          (true, false)
        RETURNING
          users.id
    }.squish);
}

@system unittest
{
    auto v = new TestVisitor;
    auto u = table("users");
    auto q = table("queues");
    auto b = InsertBuilder.init;

    b.into(u, [u["email"], u["active"]])
     .select(s => s.select(q["email"], true)
                   .from(q))
     .returning(u["id"])
     .accept(v);

    assert(v.sql.squish == q{
        INSERT INTO
          users(users.email, users.active)
        SELECT
          queues.email,
          true
        FROM
          queues
        RETURNING
          users.id
    }.squish);
}
