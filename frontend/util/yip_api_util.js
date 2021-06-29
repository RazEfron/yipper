export const fetchYips = () => {
  return $.ajax({
    method: "GET",
    url: "/api/yips", //check rails routes
  });
};

export const fetchUserYips = (id) => {
  
  return $.ajax({
    method: "GET",
    url: `/api/users/${id}`, //check rails routes
  });
};

export const createYip = (yip) => {
  return $.ajax({
    method: "POST",
    url: "/api/yips",
    data: { yip },
  });
};
