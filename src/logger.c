#include <mruby.h>
#include <stdio.h>

static mrb_value
mrb_stderr_method(mrb_state *mrb, mrb_value self)
{
  char *s;
  int len;
  mrb_get_args(mrb, "s", &s, &len);
  fprintf(stderr, "%.*s\n", len, s);
  return self;
}

void
mrb_mruby_logger_gem_init(mrb_state* mrb)
{
  struct RClass *class = mrb_define_class(mrb, "Logger",  mrb->object_class);
  mrb_define_method(mrb, class, "stderr",  mrb_stderr_method, MRB_ARGS_REQ(1));
}

void
mrb_mruby_logger_gem_final(mrb_state* mrb)
{
  // finalizer
}
