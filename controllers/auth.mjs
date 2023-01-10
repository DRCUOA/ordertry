export function verifyAuth(req, res, next) {
  if (req.cookies.authCookie) {
    next();
  } else {
    res.render('/index');
  }
}
